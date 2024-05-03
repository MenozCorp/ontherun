import { Component } from '@angular/core';
import { LoginService } from '../login/login.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent {
  name: any;

  constructor(private service: LoginService){}

  ngOnInit() {
    const fullName = localStorage.getItem('userName');
    if (fullName) {
      const firstName = fullName.split(' ')[0];
      this.name = firstName;
    }
  }
  

  logout(){
    this.service.logout();
  }

}
