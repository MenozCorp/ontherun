import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { LoginService } from '../login/login.service';
import { ToastrService } from 'ngx-toastr';
import { DomSanitizer, SafeHtml } from '@angular/platform-browser';

@Component({
  selector: 'app-task',
  templateUrl: './task.component.html',
  styleUrls: ['./task.component.css']
})
export class TaskComponent {

  taskDetails: any;
  name: any;
  desc: any;
  showSecondDiv: boolean = false;
  locationId: any;
  status: any;
  googleMapsUrl: any;
  loading: boolean = false;
  address!: SafeHtml;

  constructor(private route: ActivatedRoute, private service: LoginService, private router: Router, private toastr: ToastrService,
    private sanitizer: DomSanitizer
  ) { }

  ngOnInit(): void {

    this.locationId = this.route.snapshot.paramMap.get('id');
    const formURlData = new FormData();
    formURlData.set('id', this.locationId);
    this.service.getSingleTask(formURlData).subscribe(
      (response) => {
        this.taskDetails = response.data;
        this.name = response.data.name;
        this.address = response.data.address;
        this.status = response.data.status
        if (this.status == 1) {
          this.showSecondDiv = true;
        }
        const latitude = parseFloat(response.data.latitude);
        const longitude = parseFloat(response.data.longitude);
        this.openGoogleMaps(latitude, longitude);
        this.desc = this.sanitizer.bypassSecurityTrustHtml(response.data.description);
        //this.desc = this.stripHtmlTags(response.data.description);
      },
      (error) => {
        console.error('Error fetching location details:', error);
      }
    );



  }

  submitAccept() {
    this.loading = true
    if (this.status == 0) {
      this.status = 1;
    }
    const formURlData = new FormData();
    formURlData.set('task_id', this.locationId);
    formURlData.set('status', this.status);
    this.service.accept(formURlData).subscribe(
      (response) => {
        if (response.success == true) {
          this.loading = false
          this.toastr.success(response.message)
          this.showSecondDiv = true;
        } else {
          this.loading = false
          this.toastr.warning(response.message)
        }
      },
      (error) => {
        this.loading = false
        console.error('Error fetching location details:', error);
      }
    );
  }

  openGoogleMaps(latitude: number, longitude: number): void {
    this.googleMapsUrl = `https://www.google.com/maps?q=${latitude},${longitude}`;
    //window.open(this.googleMapsUrl, '_blank');
  }

  openMap(){
    window.open(this.googleMapsUrl, '_blank');
  }
  stripHtmlTags(html: string): string {
    return html.replace(/<[^>]*>/g, '');
  }

  toggleSecondDiv() {
    this.showSecondDiv = !this.showSecondDiv;
  }

  continue() {
    this.router.navigate(['/confirmation', this.locationId]);
  }


}
