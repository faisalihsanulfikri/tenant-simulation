<!DOCTYPE html>
<html lang="en">
 <head>
  	<title>Surat Penugasan</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<style type="text/css">
	</style>
 </head>
 <body bgcolor="white">
  	<img src="surat-tugas/h.png" alt="img" style="margin-left: -80px; margin-top: -80px;" width="830">
  	<div class="container">
  		<div class="row">
  			<div class="col">
  				<table style="margin-left: -69px; font-size: 15px;" aria-describedby="mydesc">
			  		<tr>
						{{-- <th scope="col"></th> --}}
			  			<td>Nomor </td>
			  			<td> : </td>
			  			<td>{{ $id_paket_soal }}/{{$date}}/{{$kelas}}</td>
			  		</tr>
			  		<tr>
			  			<td>Sifat </td>
			  			<td> : </td>
			  			<td>Penting</td>
			  		</tr>
			  		<tr>
			  			<td>Lampiran </td>
			  			<td> : </td>
			  			<td>-</td>
			  		</tr>
			  		<tr>
			  			<td>Perihal </td>
			  			<td> : </td>
			  			<td>Pengawas Ujian</td>
			  		</tr>
			  	</table>
  			</div>
  			<div class="col" style="font-size: 15px; margin-left: 500px; margin-right: -100px;">
  				<table aria-describedby="mydesc">
  					<tr>
  						<th scope="col">{{$current_date}}</td>
  					</tr>
  				</table>
  			</div>
  		</div>
  		<div class="row">
  			<div class="col">
  				<table style="font-size: 15px; margin-left: -69px; margin-top: 10px;" aria-describedby="mydesc">
			  		<tr>
			  			<th scope="col">Yth.</td>
			  		</tr>
			  		<tr>
			  			<td style="font-weight: bold;">Ibu/Bapa Guru </td>
			  		</tr>
			  		<tr>
			  			<td>Di</td>
			  		</tr>
			  		<tr>
			  			<td>Tempat</td>
			  		</tr>
			  	</table>
  			</div>
  		</div>
  	</div>
  	<br>
  	<p style="font-size: 15px; text-align: justify; width: 670px; margin-left: 14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Dalam Rangka Ujian Sekolah maka kami memberikan tugas untuk melaksanakan tugas Mengawas Ruangan pada Pelaksanaan Ujian.</p>
  	<p style="font-size: 15px; text-align: justify; width: 670px; margin-left: 14px; margin-top: -14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sehubungan dengan hal tersebut, kami mohon <strong>Sdr. {{$user}}</strong> dan <strong>Sdr. {{$user2}}</strong> dapat melakukan tugas sebagai Pengawas Ujian. Adapun kegiatan akan diselenggarakan pada:</p>
  	<div class="container">
  		<div class="row">
  			<div class="col">
  				<table style="margin-left: -28px; font-size: 15px; margin-top: 10px;" aria-describedby="mydesc">
  					<tr>
  						<th scope="col">Tanggal </td>
  						<td> : </td>
  						<td>{{ strtoupper(UserHelp::tglIndoHari($tanggal)) }}</td>
  					</tr>
  					<tr>
  						<td>Tempat</td>
  						<td> : </td>
  						<td>{{$lokasi}}</td>
                    </tr>
                    <tr>
                        <td>Kelas</td>
                        <td> : </td>
                        <td>{{$kelas}}</td>
                    </tr>
            <tr>
              <td></td>
              <td></td>
            </tr>
  				</table>
  			</div>
  		</div>
  	</div>
  	<br style="margin-bottom: 5px;">
  	<p style="font-size: 15px; text-align: justify; margin-left: 14px;">Demikian surat tigas ini kami buat dengan sebenarnya dan untuk dilaksanakan sebagaimana mestinya.</p>
  	<br>
  	<br>
  	<table style="margin-left: 0px; font-size: 15px;" aria-describedby="mydesc">
        <tr style="margin-bottom: 80px;">
            <th scope="col">{{ UserHelp::tglIndoHari($current_date) }}</td>
        </tr>
        <tr>
            <td> <br/><br/><br/><br/> Kepala Sekolah </td>
        </tr>
    </table>

 </body>
</html>
