<?php

namespace Database\Seeders;

use App\Models\Pelanggan;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class MetodePembayaranSeeder extends Seeder
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

        for($i = 1; $i <= 10; $i++)
        {
            $kategoriData[] = [
                'pel_id'            => $pel_ids[array_rand($pel_ids)],
                'mtd_jenis'         => $faker->creditCardType(),
                'mtd_bank'          => $faker->company(),
                'mtd_nomor_kartu'   => $faker->creditCardNumber(),
                'mtd_expired'       => $faker->creditCardExpirationDateString(),
                'mtd_cvv'           => $faker->numberBetween(101, 999)
            ];
            echo 'Creating data: '.$i.PHP_EOL;
        }

        $chunks = array_chunk($kategoriData, 100000);
        foreach($chunks as $chunk) {
            DB::table('metode_pembayaran')->insertOrIgnore($chunk);
            echo 'Inserting data...'.PHP_EOL;
        }
    }
}
