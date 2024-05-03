import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { LoginService } from './login.service';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {

  loginForm!: FormGroup;
  passwordForm!: FormGroup;
  isPasswordVisible: boolean = false;
  loading: boolean = false;
  showSecondDiv: boolean = false;

  constructor(private loginService: LoginService, private route: Router, private toastr: ToastrService) { }


  ngOnInit(): void {
    this.initForm();
    this.initPassForm();
    // if (this.showSecondDiv == true) {
    //   this.initPassForm();
    // }
  }

  initForm() {
    this.loginForm = new FormGroup({
      email: new FormControl('', [Validators.required, Validators.email]),
      password: new FormControl('', Validators.required)
    })
  }

  initPassForm() {
    this.passwordForm = new FormGroup({
      email: new FormControl('', [Validators.required, Validators.email]),
    })
  }

  login(): void {
    this.loading = true
    this.loginForm.markAllAsTouched();
    if (this.loginForm.valid) {
      const formURlData = new FormData();
      formURlData.set('email', this.loginForm.value.email);
      formURlData.set('password', this.loginForm.value.password);
      this.loginService.loginUser(formURlData).subscribe({
        next: (resp) => {
          if (resp.success === true) {
            this.loading = false
            //localStorage.setItem('userDetail', JSON.stringify(resp.user_info));
            this.loginService.setToken(resp.data.token);
            localStorage.setItem('userName', resp.data.name)
            localStorage.setItem('userId', resp.data.id)
            this.toastr.success(resp.message);
            console.log(resp.message);
            this.route.navigateByUrl('/map');
          } else {
            this.loading = false
            this.toastr.warning(resp.message);
          }
        },
        error: (error) => {
          this.loading = false
          this.toastr.warning('Something went wrong.');
          console.error('Login error:', error.message);
        }
      });
    }
  }

  onSubmit() {
    this.loading = true
    this.passwordForm.markAllAsTouched();
    if (this.passwordForm.valid) {
      const formURlData = new FormData();
      formURlData.set('email', this.passwordForm.value.email);
      this.loginService.forgotPassword(formURlData).subscribe({
        next: (resp) => {
          if (resp.success === true) {
            this.loading = false
            this.toastr.success(resp.message);
            this.route.navigateByUrl('/');
          } else {
            this.loading = false
            this.toastr.warning(resp.message);
          }
        },
        error: (error) => {
          this.loading = false
          this.toastr.warning('Something went wrong.');
          console.error('Login error:', error.message);
        }
      });
    }
  }

  togglePasswordVisibility() {
    this.isPasswordVisible = !this.isPasswordVisible;
  }

  toggleSecondDiv() {
    this.showSecondDiv = !this.showSecondDiv;
  }


}
