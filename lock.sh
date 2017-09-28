scrot /tmp/screenlock.png 
convert /tmp/screenlock.png -noise 4x4 -implode -1.1 /tmp/screenlock_noised.png
i3lock -i /tmp/screenlock_noised.png
