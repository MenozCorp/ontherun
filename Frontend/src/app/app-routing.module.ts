import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { GoogleMapComponent } from './google-map/google-map.component';
import { TaskComponent } from './task/task.component';
import { ChangePasswordComponent } from './change-password/change-password.component';
import { UpdateProfileComponent } from './update-profile/update-profile.component';
import { AuthGuard } from './shared/auth/auth.guard';
import { ConfirmationComponent } from './confirmation/confirmation.component';


const routes: Routes = [
  { path: '', component: LoginComponent },
  { path: 'map', canActivate: [AuthGuard], component: GoogleMapComponent },
  { path: 'task/:id',canActivate: [AuthGuard], component: TaskComponent },
  { path: 'confirmation/:id',canActivate: [AuthGuard], component: ConfirmationComponent },
  { path: 'update-profile',canActivate: [AuthGuard], component: UpdateProfileComponent },
  { path: 'change-password',canActivate: [AuthGuard], component: ChangePasswordComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
