<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class VoucherSeeder extends Seeder
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

        for($i = 1; $i <= 500; $i++)
        {
            $voucherData[] = [
                'voc_kode_voucher'       => $faker->word(),
                'voc_nominal'            => $faker->numberBetween(5000, 25000)
            ];
            echo 'Creating data: '.$i.PHP_EOL;
        }

        $chunks = array_chunk($voucherData, 100000);
        foreach($chunks as $chunk) {
            DB::table('voucher')->insertOrIgnore($chunk);
            echo 'Inserting data...'.PHP_EOL;
        }
    }
}
