function [p4]=p4()
    p3t=importdata('C:\Users\alyso\OneDrive - University of Waterloo\Insole sensor fusion project\validation experiment\Moticon Data\sarah.txt');
    p3t=fillmissing(p3t.data(:,:),'spline');
    p4.walk=-p3t(3100:53821,22);
    p4.stand=-p3t(81440:85367,22);
    p4.run=-p3t(56512:64298,22);
    p4.skip=-p3t(64626:73483,22);

    p3s=importdata('C:\Users\alyso\OneDrive - University of Waterloo\Insole sensor fusion project\validation experiment\Moticon Data\sarah2.txt');
    p3s=fillmissing(p3s.data(:,:),'spline');
    p4.ascent=[-p3s(431:1549,22);-p3s(1799:2584,22);-p3s(2893:3849,22);-p3s(4305:5162,22);-p3s(5427:5915,22);-p3s(6119:6545,22);...
            -p3s(6941:7728,22);-p3s(7979:8595,22);-p3s(9044:9833,22);-p3s(10286:11236,22);-p3s(11493:11871,22);-p3s(12206:12661,22)];
    
    p4.descent=[-p3s(14136:15045,22);-p3s(15291:15884,22);-p3s(16158:16729,22);-p3s(17243:18031,22);-p3s(18394:18850,22);-p3s(19070:19557,22);...
            -p3s(19811:20483,22);-p3s(20722:21335,22);-p3s(21723:22515,22);-p3s(22776:23538,22);-p3s(23903:24387,22);-p3s(24610:25074,22)];
        
    p4.free=importdata('C:\Users\alyso\OneDrive - University of Waterloo\Insole sensor fusion project\validation experiment\Moticon Data\sarah3.txt');
    p4.free=-fillmissing(p4.free.data(:,22),'spline');
end