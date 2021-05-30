<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SEC extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'recovery_email',
        'recovery_phonenumber'
    ];
}
