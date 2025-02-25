<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserDetails extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'type',
        'bio_data',
        'status',
    ];
    public function user () {
        return $this->belongsTo(User::class);
    }
}
