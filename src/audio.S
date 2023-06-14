.global absorb_start
.global absorb_end
absorb_start:
// 44.1kHz 16 bit signed little-endian
.incbin "../audio/Karim_Flam_Absorb.pcm"
absorb_end:

.global return_start
.global return_end
return_start:
// 44.1kHz 16 bit signed little-endian
.incbin "../audio/Karim_Flam_Return.pcm"
return_end: