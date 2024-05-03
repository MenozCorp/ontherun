import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { LoginService } from '../login/login.service';
import { AbstractControl, FormControl, FormGroup, ValidatorFn, Validators } from '@angular/forms';

@Component({
  selector: 'app-change-password',
  templateUrl: './change-password.component.html',
  styleUrls: ['./change-password.component.css']
})
export class ChangePasswordComponent {

  passwordForm!: FormGroup;
  loading: boolean = false;
  isPasswordVisible: boolean = false;
  isPasswordVisible1: boolean = false;
  passwordMismatch = false;
  authToken: any;

  constructor(private loginService: LoginService, private route: Router, private toastr: ToastrService) { }

  ngOnInit(): void {
    this.initForm();
  }

  initForm() {
    this.authToken = localStorage.getItem('token');
    this.passwordForm = new FormGroup({
      email: new FormControl('', [Validators.required, Validators.email]),
      new_password: new FormControl('', Validators.required),
      confirm_password: new FormControl('', Validators.required)
    })

    this.passwordForm.get('confirm_password')?.setValidators([
      Validators.required,
      this.passwordMatchValidator()
    ]);
  }

  submit(): void {
    this.loading = true
    this.passwordForm.markAllAsTouched();
    if (this.passwordForm.valid) {
      const formURlData = new FormData();
      
      formURlData.set('token', JSON.stringify(this.authToken));
      formURlData.set('email', this.passwordForm.value.email);
      formURlData.set('new_password', this.passwordForm.value.new_password);
      formURlData.set('confirm_password', this.passwordForm.value.confirm_password);
      this.loginService.resetPassword(formURlData).subscribe({
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

  passwordMatchValidator(): ValidatorFn {
    return (control: AbstractControl): { [key: string]: any } | null => {
      const password = this.passwordForm.get('new_password')?.value;
      const confirmPassword = control.value;
      if (password !== confirmPassword) {
        this.passwordMismatch = true;
        return { passwordMismatch: true };
      } else {
        this.passwordMismatch = false;
        return null;
      }
    };
  }

  togglePasswordVisibility() {
    this.isPasswordVisible = !this.isPasswordVisible;
  }

  togglePasswordVisibility1() {
    this.isPasswordVisible1 = !this.isPasswordVisible1;
  }


}
