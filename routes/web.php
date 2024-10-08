<?php

use App\Http\Controllers\AlgoritmaController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BerandaController;
use App\Http\Controllers\ExcelController;
use App\Http\Controllers\FormController;
use App\Http\Controllers\InputModalController;
use App\Http\Controllers\MasyarakatController;
use App\Http\Controllers\KriteriaController;
use App\Http\Controllers\PenilaianController;
use App\Http\Controllers\PersenController;
use App\Http\Controllers\ProdukController;
use App\Http\Controllers\SubkriteriaController;
use App\Http\Controllers\TestingController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();
Route::get('/', function () {
    return view('home');
 });

// login & register
Route::get('register', [UserController::class, 'register'])->name('register');
Route::post('register', [UserController::class, 'register_action'])->name('register.action');
Route::get('login', [UserController::class, 'login'])->name('login');
Route::post('login', [UserController::class, 'login_action'])->name('login.action');
Route::get('password', [UserController::class, 'password'])->name('password');
Route::post('password', [UserController::class, 'password_action'])->name('password.action');
Route::get('logout', [UserController::class, 'logout'])->name('logout');

//admin
Route::middleware(['auth', 'user-access:admin'])->group(function () {
    Route::get('berandaadmin', [BerandaController::class, 'berandaadmin'])->name('berandaadmin');
    Route::resource('kriterias', KriteriaController::class);
    Route::resource('subkriterias', SubkriteriaController::class);

    //perhitungan
    Route::get('perhitungan', [AlgoritmaController::class, 'index'])->name('perhitungan.index');

    //testing
    Route::resource('form-masyarakats', TestingController::class);
    Route::resource('forms', FormController::class);

});

//petugas
Route::middleware(['auth', 'user-access:petugas'])->group(function () {
    Route::get('beranda', [BerandaController::class, 'beranda'])->name('beranda');
    Route::resource('penilaian', PenilaianController::class);
    Route::get('rangking', [AlgoritmaController::class, 'rank'])->name('rangking.index');
    Route::post('import-excel', [ExcelController::class, 'import'])->name('import.excel');
    Route::resource('persen', PersenController::class);

    Route::resource('produks', ProdukController::class);

    // input modal
    Route::resource('inputmodal', InputModalController::class);
    Route::get('rangking-modal', [AlgoritmaController::class, 'modal'])->name('rangking.modal');
});
