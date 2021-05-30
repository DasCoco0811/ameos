<?php

namespace Ameos\Core\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;

class CalculatorController extends Controller
{
    public function manageIrgendwas(){
        return view('core::myContent');
    }
}
