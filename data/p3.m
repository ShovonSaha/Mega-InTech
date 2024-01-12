function [p3]=p3()
    p3t=importdata('C:\Users\alyso\OneDrive - University of Waterloo\Insole sensor fusion project\validation experiment\Moticon Data\nirosh.txt');
    p3t=fillmissing(p3t.data(:,:),'spline');
    p3.walk=-p3t(6799:57659,22);
    p3.stand=-p3t(82939:85108,22);
    p3.run=-p3t(59142:67852,22);
    p3.skip=-p3t(68200:76303,22);

    p3s=importdata('C:\Users\alyso\OneDrive - University of Waterloo\Insole sensor fusion project\validation experiment\Moticon Data\nirosh2.txt');
    p3s=fillmissing(p3s.data(:,:),'spline');
    p3.ascent=[-p3s(487:1307,22);-p3s(1470:2121,22);-p3s(2406:3577,22);-p3s(3984:5087,22);-p3s(5285:5750,22);-p3s(5898:6314,22);...
            -p3s(6611:7410,22);-p3s(7538:8316,22);-p3s(8626:9566,22);-p3s(9773:10854,22);-p3s(11042:11446,22);-p3s(11641:11978,22)];
    
    p3.descent=[-p3s(13769:14521,22);-p3s(14659:15401,22);-p3s(15734:16687,22);-p3s(16841:17917,22);-p3s(18184:18617,22);-p3s(18732:19181,22);...
            -p3s(19557:20361,22);-p3s(20505:21268,22);-p3s(21697:22714,22);-p3s(23039:24030,22);-p3s(24331:24785,22);-p3s(24887:25344,22)];
        
    p3.free=importdata('C:\Users\alyso\OneDrive - University of Waterloo\Insole sensor fusion project\validation experiment\Moticon Data\nirosh3.txt');
    p3.free=-fillmissing(p3.free.data(:,22),'spline');
end