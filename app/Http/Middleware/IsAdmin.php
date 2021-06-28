<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class IsAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next, $admin)
    {
        // if (Auth::user() && Auth::user()->isAdmin != 1) {
        //     return redirect('/')->withErrors('Hanya admin yang dapat masuk!');
        // }
        // return $next($request);
        if (!Auth::check()) {
            return redirect('/');
        }
        $user = Auth::user();

        if ($user->isAdmin == $admin)
            return $next($request);

        return redirect('/')->withErrors('Hanya admin yang dapat masuk!');
    }
}
