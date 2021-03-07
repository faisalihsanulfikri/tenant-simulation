<?php

namespace App\Helpers;

use App\Ujian;
use App\Notifikasi;
use App\PendaftaranSertifikasi;
use Jenssegers\Date\Date;
use Illuminate\Support\Facades\DB;

class User
{
    public static function tglIndo($tgl)
    {
        Date::setLocale('id');
        $date = Date::parse($tgl)->format('j F Y');
        return $date;
    }
    public static function tglIndoHari($tgl)
    {
        Date::setLocale('id');
        $date = Date::parse($tgl)->format('l, j F Y');
        return $date;
    }

    public static function getMonth($tgl)
    {
        switch ($tgl) {
            case '1':
                $bulan = 'Januari';
                break;
            case '2':
                $bulan = 'Februari';
                break;
            case '3':
                $bulan = 'Maret';
                break;
            case '4':
                $bulan = 'April';
                break;
            case '5':
                $bulan = 'Mei';
                break;
            case '6':
                $bulan = 'Juni';
                break;
            case '7':
                $bulan = 'Juli';
                break;
            case '8':
                $bulan = 'Agustus';
                break;
            case '9':
                $bulan = 'September';
                break;
            case '10':
                $bulan = 'Oktober';
                break;
            case '11':
                $bulan = 'November';
                break;
            case '12':
                $bulan = 'Desember';
                break;
            default:
                $bulan = '-';
                break;
        }

        return $bulan;
    }
    public static function getCountPeserta($id)
    {
        $count = Ujian::where('id_sertifikasi', $id)->count();

        return $count;
    }

    public static function checkUjianTahap2($idPeserta, $idSertifikasi)
    {
        $check = Ujian::where('id_sertifikasi', $idSertifikasi)
            ->where('id_peserta', $idPeserta)
            ->where('nilai_ujian', 0)
            ->first();

        return $check;
    }

    public static function cekUjian($id, $id_peserta)
    {

        $ujian = Ujian::where('id_peserta', $id_peserta)
            ->where('id_sertifikasi', $id)->first();

        return $ujian;
    }
}
