<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\{
    Post,
    Comment,
    Category};

class IController extends Controller
{
    //view all posts//
    public function post_view()
    {
        $category = Category::all();
        // dd($category);
        $posts = Post::all();
        return view('/postview', compact('posts','category'));
    }
    //to view details of post//
    public function view_details($id)
    {
        $post = Post::where('id', $id)->with('comm')->get();
        // $comments = Comment::all();
        // $comments = Comment::where('post_id',$id)->with('post')->get();
        $category = Category::all();
        $posts=$post->toArray();
        // dd($comments);
        
        return view('/viewdetails', compact('posts','category'));
    }
    //add comment//
    public function add_comment(Request $request)
    {
        $add = new Comment;
        if($request->isMethod('post'))
        {
            $add->comment = $request->get('comment');
            $add->username = $request->get('user_name');
            $add->post_id = $request->get('post_id');

            $add->save();
        }
        return back();
    }
    //to display category according to id//
    public function display_category($id)
    {
        $categoryposts = Post::where('category_id',$id)->get();
        $category = Category::all();
        return view('/categorywise', compact('categoryposts','category'));
    }
    //to search post//
    public function search_category(Request $request)
    {
        if ($request->isMethod('post')) {
            $category1 = $request->get('searchpost'); //for text box
            $categorydata = Post::where('title', 'LIKE', '%' . $category1 . '%')->get();
            $category = Category::all();
            // print_r($categorydata);
            // $categoryposts = Post::where('category_id',$id)->get();
        }
        return view('/searchpost', compact('categorydata','category'));
    }
}