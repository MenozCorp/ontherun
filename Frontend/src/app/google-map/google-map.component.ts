import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { LoginService } from '../login/login.service';
import { ToastrService } from 'ngx-toastr';
declare var google: any;

@Component({
  selector: 'app-google-map',
  templateUrl: './google-map.component.html',
  styleUrls: ['./google-map.component.css']
})
export class GoogleMapComponent {

  tasks: any[] = [];
  loading: boolean = false;

  constructor(private router: Router, private http: HttpClient, private service: LoginService, private toastr: ToastrService) { }

  ngOnInit(): void {
    this.fetchTasks();
  }

  fetchTasks(): void {
    this.service.getAllTask().subscribe(
      (response) => {
        if (response.success) {
          this.tasks = response.data;
          this.initMap();
        } else {
          console.error('Error fetching tasks:', response.message);
        }
      },
      (error) => {
        console.error('Error fetching tasks:', error);
      }
    );
  }

  initMap(): void {
    const script = document.createElement('script');
    script.src = `https://maps.googleapis.com/maps/api/js?key=AIzaSyDZe_WAS5-_o4EDqwuZtJms9ywovof4BkM`;
    script.onload = () => this.createMap();
    document.body.appendChild(script);
  }

  // createMap(): void {

  //   const map = new google.maps.Map(document.getElementById('map') as HTMLElement, {
  //     center: { lat: this.tasks[0].latitude, lng: this.tasks[0].longitude }, // Center map on the first task location
  //     zoom: 4
  //   });

  //   const bounds = new google.maps.LatLngBounds();
  //   const path = []; // Array to store polyline path

  //   for (let i = 0; i < this.tasks.length; i++) {
  //     const position = new google.maps.LatLng(parseFloat(this.tasks[i].latitude), parseFloat(this.tasks[i].longitude));
  //     bounds.extend(position);
  //     path.push(position); // Add position to path for polyline

  //     // Create a circular marker icon
  //     const icon = {
  //       path: google.maps.SymbolPath.CIRCLE,
  //       fillColor: 'white',
  //       fillOpacity: 0.8,
  //       strokeColor: 'blue',
  //       strokeWeight: 1,
  //       scale: 20  // Adjust the scale to change the size of the circle
  //     };

  //     const marker = new google.maps.Marker({
  //       position,
  //       map,
  //       icon,
  //       label: { text: (i + 1).toString(), color: 'blue' },
  //       //label: { text: this.tasks[i].id.toString(), color: 'blue' },
  //       title: this.tasks[i].name
  //     });


  //     marker.addListener('click', () => {
  //       this.getLocationDetails(this.tasks[i].id);
  //     });

  //   }

  //   // Automatically adjust the map zoom to fit all the markers
  //   map.fitBounds(bounds);

  //   // //Add polyline to connect all locations
  //   // const polyline = new google.maps.Polyline({
  //   //   path,
  //   //   geodesic: true,
  //   //   strokeColor: 'blue',
  //   //   strokeOpacity: 1.0,
  //   //   strokeWeight: 2
  //   // });
  //   // polyline.setMap(map);

  // }

  createMap(): void {


    const mapOptions = {
      zoom: 4,
      center: { lat: 25.304867300025933, lng: 78.56014738728993 } // Default center if no tasks
    };
    // if (this.tasks.length == 0) {
    //   // window.alert('No tasks found.');
    //   this.toastr.warning('No tasks found.');
    // }

    if (this.tasks.length > 0) {
      // If there are tasks, set the center and zoom level based on the first task location
      mapOptions.center = { lat: parseFloat(this.tasks[0].latitude), lng: parseFloat(this.tasks[0].longitude) };
    }

    if (this.tasks.length == 0) {
      // window.alert('No tasks found.');
      this.toastr.warning('No tasks found.');
    }

    const map = new google.maps.Map(document.getElementById('map') as HTMLElement, mapOptions);
    const bounds = new google.maps.LatLngBounds();
    const path = []; // Array to store polyline path

    for (let i = 0; i < this.tasks.length; i++) {
      const position = new google.maps.LatLng(parseFloat(this.tasks[i].latitude), parseFloat(this.tasks[i].longitude));
      bounds.extend(position);
      path.push(position); // Add position to path for polyline

      // Create a circular marker icon
      const icon = {
        path: google.maps.SymbolPath.CIRCLE,
        fillColor: 'white',
        fillOpacity: 0.8,
        strokeColor: 'blue',
        strokeWeight: 2,
        scale: 20  // Adjust the scale to change the size of the circle
      };

      const marker = new google.maps.Marker({
        position,
        map,
        icon,
        //label: { text: (i + 1).toString(), color: 'blue' },
        label: { text: this.tasks[i].id.toString(), color: 'blue' },
        title: this.tasks[i].name
      });

      marker.addListener('click', () => {
        this.getLocationDetails(this.tasks[i].id);
      });

      // if (i < this.tasks.length - 1) {
      //   this.calculateAndDisplayRoute(map, this.tasks[i], this.tasks[i + 1]);
      // }
    }
    

    // Automatically adjust the map zoom to fit all the markers if there are tasks
    if (this.tasks.length > 0) {
      map.fitBounds(bounds);
    }
    

    //Add polyline to connect all locations
    const polyline = new google.maps.Polyline({
      path,
      geodesic: true,
      strokeColor: 'blue',
      strokeOpacity: 1.0,
      strokeWeight: 2
    });
    polyline.setMap(map);

  }


  // calculateAndDisplayRoute(map: any, origin: any, destination: any): void {
  //   const directionsService = new google.maps.DirectionsService();
  //   map = new google.maps.Map
  //   const directionsRenderer = new google.maps.DirectionsRenderer({ map });
  
  //   directionsService.route(
  //     {
  //       origin: new google.maps.LatLng(parseFloat(origin.latitude), parseFloat(origin.longitude)),
  //       destination: new google.maps.LatLng(parseFloat(destination.latitude), parseFloat(destination.longitude)),
  //       travelMode: google.maps.TravelMode.DRIVING
  //     },
  //     (response: any, status: string) => {
  //       if (status === 'OK') {
  //         directionsRenderer.setDirections(response);
  //       } else {
  //         window.alert('Directions request failed due to ' + status);
  //       }
  //     }
  //   );
  // }


  getLocationDetails(locationId: any): void {
    //this.loading = true
    const formData = new FormData();
    formData.set('id', locationId);
    this.service.getSingleTask(formData).subscribe({
      next: (response) => {
        //this.loading = false
        if (response && response.data && response.data.name) {
          console.log(response);
          this.router.navigate(['/task', locationId]);
        } else {
          //this.loading = false
          console.error('Invalid response data:', response);
        }
      },
      error: (error) => {
        //this.loading = false
        console.error('Error fetching location details:', error);
      }
    }
    );
  }








}
