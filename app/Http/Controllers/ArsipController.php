<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Arsip;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class ArsipController extends Controller
{
    //index (menampilkan semua)
    public function index(){
        //untuk mendeklar status foto/status ijazah dari flutter tanpa db
        return DB::select('select *, (CASE when foto = "1" then "Belum ada Foto" when foto = "2" then "Sudah ada Foto" else "-" END) as statusfoto, (CASE when kelengkapan = "1" then "Masih di UT Pusat" when kelengkapan = "2" then "Sudah Dikirim" else "-" END) as statuskelengkapan from arsips', []);
         //return Arsip::all();
    }

    //index (menyimpan data)
    public function create(Request $request){
        $arsip = new Arsip;
        //$arsip->no = $request->no;
        $arsip->nim = $request->nim;
        $arsip->nama = $request->nama;
        $arsip->batch = $request->batch;
        $arsip->prodi = $request->prodi;
        $arsip->upbjj = $request->upbjj;
        $arsip->yudisium = $request->yudisium;
        $arsip->kelengkapan = $request->kelengkapan;
        $arsip->foto = $request->foto;
        // $arsip->kirim = $request->kirim;
        $arsip->save();

        return "Data Berhasil Masuk";
    }

    public function cari(Request $request){
        $cari = $request->nim;
        $posisi = $request->posisi;
        $batas = $request->batas;
        if($posisi == null){
            $posisi = 0;
        }
        if($batas == null){
            $batas = 10;
        }

        if($cari != '0'){
            return DB::select('select *, (CASE when foto = "1" then "Belum ada Foto" when foto = "2" then "Sudah ada Foto" else "-" END) as statusfoto, (CASE when kelengkapan = "1" then "Masih di UT Pusat" when kelengkapan = "2" then "Sudah Dikirim" else "-" END) as statuskelengkapan from arsips where nim = ? ', [$cari]);
        }else{
            return DB::select('select *, (CASE when foto = "1" then "Belum ada Foto" when foto = "2" then "Sudah ada Foto" else "-" END) as statusfoto, (CASE when kelengkapan = "1" then "Masih di UT Pusat" when kelengkapan = "2" then "Sudah Dikirim" else "-" END) as statuskelengkapan from arsips limit '.$posisi.','.$batas.'', []);
         //return Arsip::all();
        }
        
    }

    //index (update semua)
    public function update(Request $request, $id){
        // $no = $request->no;
        $nim = $request->nim;
        $nama = $request->nama;
        $batch = $request->batch;
        $prodi = $request->prodi;
        $upbjj = $request->upbjj;
        $yudisium = $request->yudisium;
        $kelengkapan = $request->kelengkapan;
        $foto = $request->foto;
        // $kirim = $request->kirim;

        $arsip = Arsip::find($id);
        // $arsip->no = $no;
        $arsip->nim = $nim;
        $arsip->nama = $nama;
        $arsip->batch = $batch;
        $arsip->prodi = $prodi;
        $arsip->upbjj = $upbjj;
        $arsip->yudisium = $yudisium;
        $arsip->kelengkapan = $kelengkapan;
        $arsip->foto = $foto;
        // $arsip->kirim = $kirim;
        $arsip->save();

        return "Data Berhasil di Update";
    }

    //delete
    public function delete($id){
        $arsip = Arsip::find($id);
        $arsip->delete();

        return "Data Berhasil di Hapus";
    }

    //generate pw laravel
    public function pass(Request $request){
        $pass = $request->password;
       

        return Hash::make($pass);
    }

    //Login Controller
    public function login(Request $request){
        $username = $request->username;
        $pass = $request->password;
        $status = "Username tidak ada";
        $user = DB::table('useradmin') -> where(["username" => $username]) -> get();
        if($user != NULL){
            foreach($user as $val){
                $enkripsi = $val->password;
                if(Hash::check($pass, $enkripsi)){
                    $status = 'Login Sukses';
                }else{
                    $status = 'Password Salah';
                }
            }
         }else{
             $status = 'Username tidak ditemukan';
         }
  

        return $status;
    }

}
