@extends('layouts.auth')

@section('css')

<style>
    .invalid-feedback {
        display: block
    }
</style>
@endsection

@section('content')
<p class="login-box-msg">Register to start your session</p>

 
 
                 
                    <form method="POST" action="{{ route('register') }}">
                        @csrf

                        <div class="input-group">
                            <input type="text" name="first_name" class="form-control @error('first_name') is-invalid @enderror"
                                placeholder="first name"   required autocomplete="first_name">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                        </div>

                        <div class="input-group">
                            <input type="text" name="last_name" class="form-control @error('last_name') is-invalid @enderror"
                                placeholder="Last name"   required autocomplete="last_name">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                        </div>

                        <div class="input-group">
                            <input type="email" name="email" class="form-control @error('email') is-invalid @enderror"
                                placeholder="email"  required autocomplete="email">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-envelope"></span>
                                </div>
                            </div>
                        </div>
                        

                        <div class="input-group">
                            <input type="password" name="password" class="form-control @error('password') is-invalid @enderror"
                                placeholder="password"  required autocomplete="password">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-key"></span>
                                </div>
                            </div>
                        </div>

                        <div class="input-group">
                            <input type="password" name="password_confirmation" class="form-control @error('password-confirm') is-invalid @enderror"
                                placeholder="password-confirm"  required autocomplete="new-password">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-key"></span>
                                </div>
                            </div>
                        </div>
   

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Register') }}
                                </button>
                            </div>
                        </div>
                    </form>
                 
             
</div>
@endsection
