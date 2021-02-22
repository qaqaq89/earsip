<?php

namespace App\Http\Controllers;
use illuminate\Support\Facades\DB;

use Illuminate\Http\Request;
use App\upbjj;
use App\Arsip;


class grafikController  extends Controller
{
    //index (menampilkan semua)
    public function index(){
        //untuk memanggil query tabel upbjj (db)
        $grafik = \DB::table('upbjjs') -> get();

        //untuk menampung variabel $data
        $array = array();

        //looping
        foreach($grafik as $val){
            $namaupbjj = $val -> namaupbjj;

            //cari data dari tabel arsip yg nama nama upbjj yg telah dilooping dari variabel grafik
            $jumlahbelumfotobelumkirim = \DB::table('arsips') -> where(['upbjj'=> $namaupbjj, 'foto' => 1, 'kelengkapan' => 1]) -> count();
            $jumlahbelumfotosudahkirim = \DB::table('arsips') -> where(['upbjj'=> $namaupbjj, 'foto' => 1, 'kelengkapan' => 2]) -> count();
           
                //JIKA SALAH SATU NILAI TERPENUHI ATAU TIDAK SAMADENGAN 0 (!=) MAKA TETAP DITAMPILKAN
            if($jumlahbelumfotosudahkirim !=0 || $jumlahbelumfotobelumkirim !=0){
                $data['namaupbjj'] = $namaupbjj;            
                $data['jumlahbelumfotobelumkirim'] = $jumlahbelumfotobelumkirim;
                $data['jumlahbelumfotosudahkirim'] = $jumlahbelumfotosudahkirim;
               
                
                array_push($array, $data);
            }
            //menampung data variabel yg telah dibuat
           

            //memasukkan variabel data kedalam variabel array
            
        }
        header('Content-Type: application/json');
        //dikeluarkan sbg format json
        echo json_encode($array);
        
    }

    public function adafoto(){
        //untuk memanggil query tabel upbjj (db)
        $grafik = \DB::table('upbjjs') -> get();

        //untuk menampung variabel $data
        $array = array();

        //looping
        foreach($grafik as $val){
            $namaupbjj = $val -> namaupbjj;

            //cari data dari tabel arsip yg nama nama upbjj yg telah dilooping dari variabel grafik
           
            
            $jumlahsudahfotobelumkirim = \DB::table('arsips') -> where(['upbjj'=> $namaupbjj, 'foto' => '2', 'kelengkapan' => '1']) -> count();
            $jumlahsudahfotosudahkirim = \DB::table('arsips') -> where(['upbjj'=> $namaupbjj, 'foto' => '2', 'kelengkapan' => '2']) -> count();
            
            //JIKA SALAH SATU NILAI TERPENUHI ATAU TIDAK SAMADENGAN 0 (!=) MAKA TETAP DITAMPILKAN
            if($jumlahsudahfotobelumkirim !=0 || $jumlahsudahfotosudahkirim !=0){
                $data['namaupbjj'] = $namaupbjj;            
               
                $data['jumlahsudahfotobelumkirim'] = $jumlahsudahfotobelumkirim;
                $data['jumlahsudahfotosudahkirim'] = $jumlahsudahfotosudahkirim;
                array_push($array, $data);
            }
            //menampung data variabel yg telah dibuat
           

            //memasukkan variabel data kedalam variabel array
            
        }
        header('Content-Type: application/json');
        //dikeluarkan sbg format json
        echo json_encode($array);
        
    }

    public function utpusat(){
        //untuk memanggil query tabel upbjj (db)
        $grafik = \DB::table('upbjjs') -> get();

        //untuk menampung variabel $data
        $array = array();

        //looping
        foreach($grafik as $val){
            $namaupbjj = $val -> namaupbjj;

            //cari data dari tabel arsip yg nama nama upbjj yg telah dilooping dari variabel grafik
           
            
            $jumlahijazahutpusat = \DB::table('arsips') -> where(['upbjj'=> $namaupbjj, 'kelengkapan' => '1']) -> count();
            
            //JIKA SALAH SATU NILAI TERPENUHI ATAU TIDAK SAMADENGAN 0 (!=) MAKA TETAP DITAMPILKAN
            if($jumlahijazahutpusat !=0){
                $data['namaupbjj'] = $namaupbjj;            
               
                $data['jumlahijazahutpusat'] = $jumlahijazahutpusat;
                
                array_push($array, $data);
            }
            //menampung data variabel yg telah dibuat
           

            //memasukkan variabel data kedalam variabel array
            
        }
        header('Content-Type: application/json');
        //dikeluarkan sbg format json
        echo json_encode($array);
        
    }

    public function utupbjj(){
        //untuk memanggil query tabel upbjj (db)
        $grafik = \DB::table('upbjjs') -> get();

        //untuk menampung variabel $data
        $array = array();

        //looping
        foreach($grafik as $val){
            $namaupbjj = $val -> namaupbjj;

            //cari data dari tabel arsip yg nama nama upbjj yg telah dilooping dari variabel grafik
           
            
            $jumlahijazahutupbjj = \DB::table('arsips') -> where(['upbjj'=> $namaupbjj, 'kelengkapan' => '2']) -> count();
            
            //JIKA SALAH SATU NILAI TERPENUHI ATAU TIDAK SAMADENGAN 0 (!=) MAKA TETAP DITAMPILKAN
            if($jumlahijazahutupbjj !=0){
                $data['namaupbjj'] = $namaupbjj;            
               
                $data['jumlahijazahutupbjj'] = $jumlahijazahutupbjj;
                
                array_push($array, $data);
            }
            //menampung data variabel yg telah dibuat
           

            //memasukkan variabel data kedalam variabel array
            
        }
        header('Content-Type: application/json');
        //dikeluarkan sbg format json
        echo json_encode($array);
        
    }

    public function belumadafoto(){
        //untuk memanggil query tabel upbjj (db)
        $grafik = \DB::table('upbjjs') -> get();

        //untuk menampung variabel $data
        $array = array();

        //looping
        foreach($grafik as $val){
            $namaupbjj = $val -> namaupbjj;

            //cari data dari tabel arsip yg nama nama upbjj yg telah dilooping dari variabel grafik
           
            
            $jumlahijazahbelumadafoto = \DB::table('arsips') -> where(['upbjj'=> $namaupbjj, 'foto' => '1']) -> count();
            
            //JIKA SALAH SATU NILAI TERPENUHI ATAU TIDAK SAMADENGAN 0 (!=) MAKA TETAP DITAMPILKAN
            if($jumlahijazahbelumadafoto !=0){
                $data['namaupbjj'] = $namaupbjj;            
               
                $data['jumlahijazahbelumadafoto'] = $jumlahijazahbelumadafoto;
                
                array_push($array, $data);
            }
            //menampung data variabel yg telah dibuat
           

            //memasukkan variabel data kedalam variabel array
            
        }
        header('Content-Type: application/json');
        //dikeluarkan sbg format json
        echo json_encode($array);
        
    }

    public function sudahadafoto(){
        //untuk memanggil query tabel upbjj (db)
        $grafik = \DB::table('upbjjs') -> get();

        //untuk menampung variabel $data
        $array = array();

        //looping (untuk mengulang data)
        foreach($grafik as $val){
            $namaupbjj = $val -> namaupbjj;

            //cari data dari tabel arsip yg nama nama upbjj yg telah dilooping dari variabel grafik
           
            
            $jumlahijazahsudahadafoto = \DB::table('arsips') -> where(['upbjj'=> $namaupbjj, 'foto' => '2']) -> count();
            
            //JIKA SALAH SATU NILAI TERPENUHI ATAU TIDAK SAMADENGAN 0 (!=) MAKA TETAP DITAMPILKAN
            if($jumlahijazahsudahadafoto !=0){
                $data['namaupbjj'] = $namaupbjj;            
               
                $data['jumlahijazahsudahadafoto'] = $jumlahijazahsudahadafoto;
                
                array_push($array, $data);
            }
            //menampung data variabel yg telah dibuat
           

            //memasukkan variabel data kedalam variabel array
            
        }
        header('Content-Type: application/json');
        //dikeluarkan sbg format json
        echo json_encode($array);
        
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

    // public function asik(){
    //     $grafik = upbjj::all();
    //     print_r($grafik);
    // }

}
