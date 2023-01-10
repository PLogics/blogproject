<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    {{-- <link rel="stylesheet" href="{{asset('http://localhost/UserProfile/resources/css/userstyle.css')}}"> --}}
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    {{-- <script src="https://cdn.tailwindcss.com"></script> --}}
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <title>Document</title>
</head>

<body>

    @include ('layouts/navigation')

    <!-- Create By Joker Banny -->
    <div class="min-h-screen bg-gradient-to-tr from-red-300 to-yellow-200 flex justify-center items-center py-20">
        <div class="md:px-4 md:grid md:grid-cols-2 lg:grid-cols-3 gap-5 space-y-4 md:space-y-0 w-50">
            @foreach ($posts as $row)
                <div class="max-w-sm bg-white px-6 pt-6 pb-2 rounded-xl shadow-lg transform hover:scale-105 transition duration-500">
                    <h3 class="mb-3 text-xl font-bold text-indigo-600">{{ $row['title'] }}</h3>
                    <div class="relative">
                        <span>
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-indigo-600 mb-1.5"
                                fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                            </svg>
                            <p>{{ $row['created_at'] }}</p>
                        </span>
                        
                        <img class="w-50 rounded-s" src="{{ $row['image'] }}" alt="..." />
                        <p class="absolute top-0 bg-yellow-300 text-gray-800 font-semibold py-1 px-3 rounded-br-lg rounded-tl-lg">
                        </p>
                    </div>
                    <h4 class="mt-4 text-gray-800 text-2xl font-bold cursor-pointer">{{ $row['description'] }}</h4>
                    <div class="my-4 ">
                        <div class="flex space-x-1 items-center">
                            <p> {{ $row['detail'] }} </p>
                        </div>
                        <div class="flex space-x-1 items-center">
                        
                        {{-- //Comment section// --}}
                            <section class="bg-white dark:bg-gray-900 py-8 lg:py-16">
                                <div class="w-100 mx-auto px-4">
                                    <div class="flex justify-between items-center mb-6">
                                        <h2 class="text-lg lg:text-l font-bold text-gray-900 dark:text-white">
                                            Discussion</h2>
                                    </div>
                                 
                                    <form class="mb-6" method="post" action="{{url('addcomment')}}">
                                        @csrf
                                        <div class="py-2 px-4 mb-4 bg-white rounded-lg rounded-t-lg border border-gray-200 dark:bg-gray-800 dark:border-gray-700">
                                            <label for="comment" class="sr-only">Your comment</label>
                                            <textarea id="comment" rows="6"
                                                class="px-0 w-full text-sm text-gray-900 border-0 focus:ring-0 focus:outline-none dark:text-white dark:placeholder-gray-400 dark:bg-gray-800"
                                                placeholder="Write a comment..." required name="comment"></textarea>
                                        </div>
                                        @auth
                                        <input type="hidden" name="user_name" value="{{Auth::User()->name}}"/>
                                        <input type="hidden" name="post_id" value="{{$row['id']}}"/>
                                        {{-- @else
                                        User --}}
                                        @endauth
                                        <input class="btn btn-primary" type="submit" value="Post Comment" name="save"/> 
                                    </form>
                                    
                                    <article class="p-6 mb-6 text-base bg-white rounded-lg dark:bg-gray-900">
                                        @foreach ($posts as $row)
                                        @for ($id=count($row['comm'])-1; $id>=0;$id--)
                                        <footer class="flex justify-between items-center mb-2">
                                            <div class="flex items-center">
                                                <p class="inline-flex items-center mr-3 text-sm text-gray-900 dark:text-white">
                                                       
                                                    <img class="mr-2 w-6 h-6 rounded-full"
                                                        src="https://flowbite.com/docs/images/people/profile-picture-2.jpg"
                                                        alt="....">{{ $row['comm'][$id]['username']}}</p>
                                                        
                                                <p class="text-sm text-gray-600 dark:text-gray-400"><time pubdate
                                                        datetime="2022-02-08" title="February 8th, 2022">
                                                        {{ date('D.d.M.Y H:m:s',strtotime($row['comm'][$id]['created_at']) )}}</time></p>
                                            </div>
                                            <button id="dropdownComment1Button" data-dropdown-toggle="dropdownComment1"
                                                class="inline-flex items-center p-2 text-sm font-medium text-center text-gray-400 bg-white rounded-lg hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-50 dark:bg-gray-900 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
                                                type="button">
                                                <svg class="w-5 h-5" aria-hidden="true" fill="currentColor"
                                                    viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M6 10a2 2 0 11-4 0 2 2 0 014 0zM12 10a2 2 0 11-4 0 2 2 0 014 0zM16 12a2 2 0 100-4 2 2 0 000 4z">
                                                    </path>
                                                </svg>
                                                <span class="sr-only">Comment settings</span>
                                            </button>
                                            <!-- Dropdown menu -->
                                            {{-- <div id="dropdownComment1"
                                                class="hidden z-10 w-36 bg-white rounded divide-y divide-gray-100 shadow dark:bg-gray-700 dark:divide-gray-600">
                                                <ul class="py-1 text-sm text-gray-700 dark:text-gray-200"
                                                    aria-labelledby="dropdownMenuIconHorizontalButton">
                                                    <li>
                                                        <a href="#"
                                                            class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Edit</a>
                                                    </li>
                                                    <li>
                                                        <a href="#"
                                                            class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Remove</a>
                                                    </li>
                                                    <li>
                                                        <a href="#"
                                                            class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Report</a>
                                                    </li>
                                                </ul>
                                            </div> --}}
                                        </footer>
                                        
                                        <p class="text-gray-500 dark:text-gray-400">{{$row['comm'][$id]['comment']}}</p>
                                        <div class="flex items-center mt-4 space-x-4">
                                            {{-- <button type="button"
                                                class="flex items-center text-sm text-gray-500 hover:underline dark:text-gray-400">
                                                <svg aria-hidden="true" class="mr-1 w-4 h-4" fill="none"
                                                    stroke="currentColor" viewBox="0 0 24 24"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                        stroke-width="2"
                                                        d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z">
                                                    </path>
                                                </svg>
                                                Reply
                                            </button> --}}
                                        </div>
                                        @endfor
                                    @endforeach
                                    </article>
                                </div>
                            </section>  
                            {{-- <span>
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-indigo-600 mb-1.5"
                                fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M16 4v12l-4-2-4 2V4M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
                            </svg>
                        </span> --}}
                            {{-- <p>3 Parts</p> --}}
                        </div>
                        {{-- <div class="flex space-x-1 items-center">
                            <span>
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-indigo-600 mb-1.5"
                                fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4" />
                            </svg>
                        </span>
                            <p>Vanilla JS</p>
                        </div> --}}

                    </div>
                </div>
            @endforeach
        </div>
    </div>

</body>

</html>
