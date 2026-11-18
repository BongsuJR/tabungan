<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		Halaman Utama
		<small>Wali Murid</small>
	</h1>
</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="box box-warning">
				<div class="box-header">
					<strong>Profil Sekolah</strong>
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
				<div class="box-body">
					<div class="table-responsive">
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Nama Sekolah</th>
									<th>Alamat</th>
									<th>Akreditasi</th>
								</tr>
							</thead>
							<tbody>

								<?php
                  $sql = $koneksi->query("select * from tb_profil");
                  while ($data= $sql->fetch_assoc()) {
                ?>

								<tr>
									<td>
										<?php echo $data['nama_sekolah']; ?>
									</td>
									<td>
										<?php echo $data['alamat']; ?>
									</td>
									<td>
										Akreditasi
										<?php echo $data['akreditasi']; ?>
									</td>
								</tr>
								<?php
                  }
                ?>
							</tbody>

						</table>
					</div>
				</div>
			</div>
		</div>
	</section>