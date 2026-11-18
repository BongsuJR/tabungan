<section class="content-header">
	<h1>
		Master Data
		<small>Siswa</small>
	</h1>
	<ol class="breadcrumb">
		<li>
			<a href="index.php">
				<i class="fa fa-home"></i>
				<b>Si Kemas</b>
			</a>
		</li>
	</ol>
</section>

<section class="content">
	<div class="row">
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-info">
				<div class="box-header with-border">
					<h3 class="box-title">Tambah Siswa</h3>
					<div class="box-tools pull-right">
						<button type="button" class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button type="button" class="btn btn-box-tool" data-widget="remove">
							<i class="fa fa-remove"></i>
						</button>
					</div>
				</div>
				<!-- /.box-header -->
				<!-- form start -->
				<form action="" method="post" enctype="multipart/form-data">
					<div class="box-body">
						<div class="form-group">
							<label>NIS</label>
							<input type="text" name="nis" id="nis" class="form-control" placeholder="NIS">
						</div>

						<div class="form-group">
							<label>Nama Siswa</label>
							<input type="text" name="nama_siswa" id="nama_siswa" class="form-control" placeholder="Nama Siswa">
						</div>

						<div class="form-group">
							<label>Jenis Kelamin</label>
							<select name="jekel" id="jekel" class="form-control" required>
								<option>-- Pilih --</option>
								<option>Laki-Laki</option>
								<option>Perempuan</option>
							</select>
						</div>

						<div class="form-group">
							<label>Kelas</label>
							<select name="kelas" id="kelas" class="form-control" required>
								<option>-- Pilih --</option>
								<option>Kelas A</option>
								<option>Kelas B</option>
								<option>Kelas C</option>
							</select>
						</div>

						<div class="form-group">
							<label>Tahun Masuk</label>
							<input type="number" name="th_masuk" id="th_masuk" class="form-control">
						</div>

					</div>
					<!-- /.box-body -->

					<div class="box-footer">
						<input type="submit" name="Simpan" value="Simpan" class="btn btn-info">
						<a href="?page=MyApp/data_siswa" class="btn btn-warning">Batal</a>
					</div>
				</form>
			</div>
			<!-- /.box -->
</section>

<?php

    if (isset ($_POST['Simpan'])){
    
        $sql_simpan = "INSERT INTO tb_siswa (nis,nama_siswa,jekel,kelas,status,th_masuk) VALUES (
           '".$_POST['nis']."',
          '".$_POST['nama_siswa']."',
          '".$_POST['jekel']."',
          '".$_POST['kelas']."',
          'Aktif',
          '".$_POST['th_masuk']."')";
        $query_simpan = mysqli_query($koneksi, $sql_simpan);
        mysqli_close($koneksi);

    if ($query_simpan){

      echo "<script>
      Swal.fire({title: 'Tambah Data Berhasil',text: '',icon: 'success',confirmButtonText: 'OK'
      }).then((result) => {
          if (result.value) {
              window.location = 'index.php?page=MyApp/data_siswa';
          }
      })</script>";
      }else{
      echo "<script>
      Swal.fire({title: 'Tambah Data Gagal',text: '',icon: 'error',confirmButtonText: 'OK'
      }).then((result) => {
          if (result.value) {
              window.location = 'index.php?page=MyApp/add_siswa';
          }
      })</script>";
    }
  }
    
