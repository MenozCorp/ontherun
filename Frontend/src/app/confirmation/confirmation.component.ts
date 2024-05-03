import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { LoginService } from '../login/login.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-confirmation',
  templateUrl: './confirmation.component.html',
  styleUrls: ['./confirmation.component.css']
})
export class ConfirmationComponent {

  confirmationDetails: any;
  showSecondDiv: boolean = false;
  status: any;
  locationId: any;
  desc: any;
  name: any;
  loading: boolean = false;

  constructor(private route: ActivatedRoute, private service: LoginService, private toastr: ToastrService, private router: Router) { }

  ngOnInit(): void {

    this.locationId = this.route.snapshot.paramMap.get('id');
    const formURlData = new FormData();
    formURlData.set('id', this.locationId);
    this.service.getSingleTask(formURlData).subscribe(
      (response) => {
        this.confirmationDetails = response.data;
        this.name = response.data.name;
        this.status = response.data.status
        this.desc = this.stripHtmlTags(response.data.description);
      },
      (error) => {
        console.error('Error fetching location details:', error);
      }
    );

  }

  submitConfirm() {
    this.loading = true
    if (this.status == 1) {
      this.status = 2;
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

  stripHtmlTags(html: string): string {
    return html.replace(/<[^>]*>/g, '');
  }

  cancle(){
    this.router.navigate(['/task', this.locationId]);
  }

  // toggleSecondDiv() {
  //   this.showSecondDiv = !this.showSecondDiv;
  // }

  logout(){
    this.service.logout();
  }
  

}
