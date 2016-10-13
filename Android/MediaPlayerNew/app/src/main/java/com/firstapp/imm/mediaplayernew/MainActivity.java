package com.firstapp.imm.mediaplayernew;

import android.content.Intent;
import android.media.MediaPlayer;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.SeekBar;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    private MediaPlayer mediaPlayer;

    public TextView text_SongName;
    public TextView text_SongDuration;

    private SeekBar seekBar;

    private double timeElapsed = 0;
    private double finalTime = 0;
    private int forwardTime = 2000;
    private int backwardTime = 2000;

    public Handler durationHandler = new Handler(); //Used for updating the seekbar

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        //Initialise view/UI
        setContentView(R.layout.activity_main);

        initialiseView();
    }
    public void buttonClick(View view) {
        Intent intent = new Intent(this, Main2Activity.class);
        startActivity(intent);
    }

    public void initialiseView()
    {
        text_SongName = (TextView) findViewById(R.id.songName);
        text_SongDuration = (TextView) findViewById(R.id.songDuration);

        seekBar = (SeekBar) findViewById(R.id.seekBar);

        mediaPlayer = MediaPlayer.create(this,R.raw.goodbye);
        finalTime = mediaPlayer.getDuration();

        seekBar.setMax((int) finalTime);
        seekBar.setClickable(false);
        durationHandler.postDelayed(updateSeekBarTime, 100);
    }

    public void play(View view)
    {
        mediaPlayer.start();
        timeElapsed = mediaPlayer.getCurrentPosition();
        seekBar.setProgress((int) timeElapsed);
        //durationHandler.postDelayed();
    }

    private Runnable updateSeekBarTime = new Runnable() {
        @Override
        public void run() {
            timeElapsed = mediaPlayer.getCurrentPosition();
            seekBar.setProgress((int) timeElapsed);
            double timeRemaining = finalTime - timeElapsed;
            text_SongDuration.setText(Double.toString(timeRemaining)); //There's a long bit of code onverting it to hh mm ss and ms
            durationHandler.postDelayed(this, 100);
        }

    };

    public void pause(View view)
    {
        mediaPlayer.pause();
    }

    public void forward(View view)
    {
        if((timeElapsed + forwardTime) > 0)
        {
            timeElapsed = timeElapsed + forwardTime;

            mediaPlayer.seekTo((int) timeElapsed);
        }
    }



}

