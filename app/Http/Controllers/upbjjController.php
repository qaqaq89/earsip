<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\upbjj;

class upbjjController  extends Controller
{
    //index (menampilkan semua)
    public function index(){
        return upbjj::all();
    }

    //index (menyimpan data)
    public function create(Request $request){
    }

    //index (update semua)
    public function update(Request $request, $id){
    }

    //delete
    public function delete($id){
    }

}
