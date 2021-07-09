<?php

namespace Database\Seeders;

use App\Models\MetodePembayaran;
use App\Models\Pelanggan;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class TransaksiSeeder extends Seeder
{
    /*
    *
    * Run the database seeds.
    *
    * @return void
    */
    public function run()
    {
        ini_set('memory_limit', '-1');
        $faker = Faker::create();

        $pel_ids = Pelanggan::all()->pluck('pel_id')->toArray();
        $mtd_ids = MetodePembayaran::all()->pluck('mtd_id')->toArray();

        for($i = 1; $i <= 30000; $i++)
        {
            $kategoriData[] = [
                'pel_id'            => $pel_ids[array_rand($pel_ids)],
                'mtd_id'            => $mtd_ids[array_rand($mtd_ids)]
            ];
            echo 'Creating data: '.$i.PHP_EOL;
        }

        $chunks = array_chunk($kategoriData, 100000);
        foreach($chunks as $chunk) {
            DB::table('transaksi')->insertOrIgnore($chunk);
            echo 'Inserting data...'.PHP_EOL;
        }
    }
}
