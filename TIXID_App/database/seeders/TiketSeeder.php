<?php

namespace Database\Seeders;

use App\Models\Bioskop;
use App\Models\Film;
use App\Models\Jadwal;
use App\Models\Transaksi;
use App\Models\Kursi;
use App\Models\Studio;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class TiketSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        ini_set('memory_limit', '-1');
        $faker = Faker::create();

        $trx_id = Transaksi::all()->pluck('trx_id')->toArray();
        $chr_id = Kursi::all()->pluck('chr_id')->toArray();

        for($i = 1; $i <= 1000; $i++)
        {
            $tiketData[] = [
                'trx_id'    => $trx_id[array_rand($trx_id)],
                'chr_id'    => $chr_id[array_rand($chr_id)],
            ];
            echo 'Creating data: '.$i.PHP_EOL;
        }

        $chunks = array_chunk($tiketData, 10000);
        foreach($chunks as $chunk) {
            DB::table('tiket')->insertOrIgnore($chunk);
            echo 'Inserting data...'.PHP_EOL;
        }

    }
}
