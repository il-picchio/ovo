// this is simply 2pi/100 in radians
const kPercentInRadians = 0.062831853071796;
// this is the gap between strokes in percent
// minimum must be 4 due to the extra space taken by StrokeCap.round
const kPadding = 4;
const kPaddingInRadians = kPadding * kPercentInRadians;