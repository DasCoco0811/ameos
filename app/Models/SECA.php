<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SECA extends Model
{
    use HasFactory;

    protected $fillable = [
        'secq_id',
        'content'
    ];
}
