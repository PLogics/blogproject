<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="{{asset('http://localhost/blogproject/resources/css/style.css')}}">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    {{-- <script src="https://cdn.tailwindcss.com"></script> --}}
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <title>Document</title>
    <script src="http://localhost/blogproject/resources/js/jquery.js"></script>
</head>

<body>

    @include ('layouts/navigation')

    <div class="container fluid mt-5">
        <div class="row justify-content text-center d-flex">
            <div>
                <h5 class="alert alert-primary">Posts</h5>
            </div>
                <div id="carouselExampleControls" class="carousel" data-bs-ride="carousel">
                    @foreach ($categoryposts as $row)
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="card">
                                <div class="img-wrapper"><img src="{{ $row->image }}" class="d-block w-100" alt="...">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">{{ $row->title }}</h5>
                                    <p class="card-text">{{ $row->description }}</p>
                                    <a href="{{ url('/viewdetails/' . $row->id) }}" class="btn btn-primary">View Details</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
        </div>
    </div>
</body>

</html>
