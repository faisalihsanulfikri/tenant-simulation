<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

use Illuminate\Http\Request;

class KirimEmail extends Mailable
{
    use Queueable, SerializesModels;
    public $data;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($data)
    {
        //
      $this->data = $data;

    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {

        return $this->view('emailku')->attach(public_path('surat-tugas/'. $this->data['file_name']), [
                      'as' => $this->data['file_name'],
                      'mime' => 'pdf',
                    ])
                    ->from('support@pijar.com')
                    ->subject('Surat Penugasan');
    }
}
