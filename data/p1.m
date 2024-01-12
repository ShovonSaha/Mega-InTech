function [p1]=p1()
    p1t=importdata('C:\Users\alyso\OneDrive - University of Waterloo\Insole sensor fusion project\validation experiment\Moticon Data\adam.txt');
    p1t=fillmissing(p1t.data(:,:),'spline');
    p1.walk=-p1t(11134:59181,22);
    p1.stand=-p1t(86205:91819,22);
    p1.run=-p1t(59181:68786,22);
    p1.skip=-p1t(68786:77119,22);

    p1a=importdata('C:\Users\alyso\OneDrive - University of Waterloo\Insole sensor fusion project\validation experiment\Moticon Data\adam2.txt');
    p1a=fillmissing(p1a.data(:,:),'spline');
    p1.ascent=[-p1a(163:933,22);-p1a(1194:1793,22);-p1a(2091:3192,22);-p1a(3531:4399,22);-p1a(4704:5085,22);-p1a(5289:5676,22);...
    -p1a(6186:6713,22);-p1a(7024:7638,22);-p1a(7929:8677,22);-p1a(9154:9968,22);-p1a(10131:10497,22);-p1a(10689:11046,22)];

    p1d=importdata('C:\Users\alyso\OneDrive - University of Waterloo\Insole sensor fusion project\validation experiment\Moticon Data\adam3.txt');
    p1d=fillmissing(p1d.data(:,:),'spline');
    p1.descent=[-p1d(174:956,22);-p1d(1072:1722,22);-p1d(1971:3024,22);-p1d(3206:4271,22);-p1d(4379:4673,22);-p1d(4848:5129,22);...
        -p1d(5328:6015,22);-p1d(6150:6864,22);-p1d(7011:8115,22);-p1d(8264:9363,22);-p1d(9515:9842,22);-p1d(10004:10372,22)];
    
    p1.free=importdata('C:\Users\alyso\OneDrive - University of Waterloo\Insole sensor fusion project\validation experiment\Moticon Data\adam4.txt');
    p1.free=-fillmissing(p1.free.data(:,22),'spline');
end