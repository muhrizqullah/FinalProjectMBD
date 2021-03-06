<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class PelangganSeeder extends Seeder
{
     /**
     * Run the database seeds.
     *
     * @return void
     */
     public function run()
     {
         ini_set('memory_limit', '-1');

         $faker = Faker::create();

         for($i = 1; $i <= 10000; $i++)
         {
             $pelangganData[] = [
                 'pel_nama'             => $faker->name(),
                 'pel_email'            => $faker->email(),
                 'pel_no_telepon'       => $faker->phoneNumber()
             ];
             echo 'Creating data: '.$i.PHP_EOL;
         }

         $chunks = array_chunk($pelangganData, 10000);
         foreach($chunks as $chunk) {
             DB::table('pelanggan')->insertOrIgnore($chunk);
             echo 'Inserting data...'.PHP_EOL;
         }
     }
}
