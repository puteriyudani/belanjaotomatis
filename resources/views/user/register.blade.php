@extends('app')
@section('content')
    <main class="form-signin w-100 m-auto text-center">
        <div class="card shadow">
            <div class="card-body">
                @if ($errors->any())
                    @foreach ($errors->all() as $err)
                        <p class="alert alert-danger">{{ $err }}</p>
                    @endforeach
                @endif
                <form action="{{ route('register.action') }}" method="POST">
                    @csrf
                    <h1 class="h3 mb-3">Register</h1>

                    <div class="form-floating">
                        <input type="text" class="form-control" id="name" name="name" placeholder="Name"
                            value="{{ old('name') }}">
                        <label for="name">Name</label>
                    </div>
                    <div class="form-floating">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Username"
                            value="{{ old('username') }}">
                        <label for="username">Username</label>
                    </div>
                    <div class="form-floating">
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                        <label for="password">Password</label>
                    </div>
                    <div class="form-floating">
                        <input type="password" class="form-control" id="password_confirm" name="password_confirm"
                            placeholder="Confirm Password">
                        <label for="password_confirm">Confirm Password</label>
                    </div>

                    <div class="form-group">
                        <select class="form-select" name="level" id="level"
                            aria-label="Floating label select example">
                            <option selected>Level</option>
                            <option value="0">Admin</option>
                            <option value="1">Petugas</option>
                        </select>
                    </div>

                    <button class="w-100 btn btn-lg btn-primary mb-2 mt-3" type="submit">Sign up</button>
                </form>
            </div>
        </div>
    </main>
@endsection

@push('css')
    <link rel="stylesheet" href="{{ asset('css/auth.css') }}" />

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }
    </style>
@endpush
