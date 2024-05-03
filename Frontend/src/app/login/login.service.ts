import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class LoginService {

  apiUrl = environment.baseUrl

  constructor(private http: HttpClient, private route: Router) { }

  setToken(token: string) {
    localStorage.setItem('token', token)
  }

  getToken() {
    return localStorage.getItem('token')
  }

  isLogedIn() {
    return this.getToken() !== null;
  }

  loginUser(params: any): Observable<any> {
    return this.http.post<any>(this.apiUrl + '/user-login', params);
  }

  logout() {
    localStorage.removeItem('token');
    localStorage.removeItem('userName');
    localStorage.removeItem('userId');
    this.route.navigateByUrl('/');
  }

  forgotPassword(params: any): Observable<any> {
    return this.http.post<any>(this.apiUrl + '/forgot-password', params);
  }

  resetPassword(params: any): Observable<any> {
    const authToken = localStorage.getItem('token');
    const headers = new HttpHeaders({
      'Authorization': `${authToken}`,
    });
    return this.http.post<any>(this.apiUrl + '/reset-password', params, { headers: headers });
  }

  updateProfile(params: any): Observable<any> {
    const authToken = localStorage.getItem('token');
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${authToken}`,
    });
    return this.http.post<any>(this.apiUrl + '/update-profile', params, { headers: headers });
  }

  getSingleUser() {
    const authToken = localStorage.getItem('token');
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${authToken}`,
    });
    return this.http.get<any>(this.apiUrl + '/get-my-profile', { headers: headers });
  }

  getAllTask() {
    const authToken = localStorage.getItem('token');
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${authToken}`,
    });
    return this.http.get<any>(this.apiUrl + '/get-all-tasks', { headers: headers });
  }

  getSingleTask(params: any): Observable<any> {
    const authToken = localStorage.getItem('token');
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${authToken}`,
    });
    return this.http.post<any>(this.apiUrl + '/get-task-detail', params, { headers: headers });
  }

  accept(params: any): Observable<any> {
    const authToken = localStorage.getItem('token');
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${authToken}`,
    });
    return this.http.post<any>(this.apiUrl + '/accept-or-complete-task', params, { headers: headers });
  }


}
