import { Component } from '@angular/core';
import { LoginService } from '../login/login.service';
import { ToastrService } from 'ngx-toastr';
import { ActivatedRoute, Router } from '@angular/router';
import { AbstractControl, FormControl, FormGroup, ValidatorFn, Validators } from '@angular/forms';

@Component({
  selector: 'app-update-profile',
  templateUrl: './update-profile.component.html',
  styleUrls: ['./update-profile.component.css']
})
export class UpdateProfileComponent {

  profileForm!: FormGroup;
  loading: boolean = false;
  isPasswordVisible: boolean = false;
  isPasswordVisible1: boolean = false;
  passwordMismatch = false;
  locationId: any;

  constructor(private router: ActivatedRoute, private loginService: LoginService, private route: Router, private toastr: ToastrService) { }

  ngOnInit(): void {
    this.getUserData();
    this.initForm();
    this.locationId = this.router.snapshot.paramMap.get('id');
  }

  goBack(){
    this.route.navigate(['/task', this.locationId]);
  }

  initForm() {
    this.profileForm = new FormGroup({
      name: new FormControl('', Validators.required),
      email: new FormControl('', [Validators.required, Validators.email]),
      number: new FormControl(''),
      password: new FormControl(''),
      confirm_password: new FormControl('')
    })

    this.profileForm.get('confirm_password')?.setValidators([
      Validators.required,
      this.passwordMatchValidator()
    ]);
  }

  getUserData() {
    this.loginService.getSingleUser().subscribe({
      next: resp => {
        // this.data1 = resp.data;
        this.profileForm.patchValue({
          name: resp.data.name,
          email: resp.data.email,
          number: resp.data.number,
          password: resp.data.password
        });
      },
      error: error => {
        console.log(error.message)
      }
    });
  }

  submit(): void {
    this.loading = true
    //this.profileForm.markAllAsTouched();
    //if (this.profileForm.valid) {
      const formURlData = new FormData();
      formURlData.set('name', this.profileForm.value.name);
      formURlData.set('email', this.profileForm.value.email);
      if(this.profileForm.value.number){
        formURlData.set('number', this.profileForm.value.number);
      }
      if(this.profileForm.value.password){
        formURlData.set('password', this.profileForm.value.password);
      }
      if(this.profileForm.value.confirm_password){
        formURlData.set('confirm_password', this.profileForm.value.confirm_password);
      }

      this.loginService.updateProfile(formURlData).subscribe({
        next: (resp) => {
          if (resp.success === true) {
            this.loading = false
            //localStorage.setItem('userDetail', JSON.stringify(resp.user_info));
            //this.loginService.setToken(resp.data.token);
            //localStorage.setItem('userName', resp.data.name)
            //localStorage.setItem('userId', resp.data.id)
            this.toastr.success(resp.message);
            console.log(resp.message);
            this.route.navigateByUrl('/map');
          } else {
            this.loading = false
            this.toastr.warning(resp.message);
          }
          this.loading = false
        },
        error: (error) => {
          this.loading = false
          this.toastr.warning('Something went wrong.');
          console.error('Login error:', error.message);
        }
      });
    //}
  }

  passwordMatchValidator(): ValidatorFn {
    return (control: AbstractControl): { [key: string]: any } | null => {
      const password = this.profileForm.get('new_password')?.value;
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
