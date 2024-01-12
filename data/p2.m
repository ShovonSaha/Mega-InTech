function [p2]=p2()
    p3t=importdata('C:\Users\alyso\OneDrive - University of Waterloo\Insole sensor fusion project\validation experiment\Moticon Data\hannah.txt');
    p3t=fillmissing(p3t.data(:,:),'spline');
    p2.walk=-p3t(6142:54603,22);
    p2.stand=-p3t(83060:88100,22);
    p2.run=-p3t(56479:63540,22);
    p2.skip=-p3t(65198:73885,22);

    p3s=importdata('C:\Users\alyso\OneDrive - University of Waterloo\Insole sensor fusion project\validation experiment\Moticon Data\hannah2.txt');
    p3s=fillmissing(p3s.data(:,:),'spline');
    p2.ascent=[-p3s(439:1016,22);-p3s(1240:1944,22);-p3s(2375:3500,22);-p3s(3847:4796,22);-p3s(5376:5837,22);-p3s(6039:6516,22);...
            -p3s(7032:7821,22);-p3s(8063:8844,22);-p3s(9263:10259,22);-p3s(10526:11700,22);-p3s(12135:12751,22);-p3s(12944:13526,22)];
    
    p2.descent=[-p3s(15694:16376,22);-p3s(16601:17257,22);-p3s(17531:18597,22);-p3s(18830:19839,22);-p3s(20104:20582,22);-p3s(20786:21251,22);...
            -p3s(21571:22190,22);-p3s(22423:23029,22);-p3s(23239:24192,22);-p3s(24418:25364,22);-p3s(25739:26216,22);-p3s(26419:26803,22)];
        
    p2.free=importdata('C:\Users\alyso\OneDrive - University of Waterloo\Insole sensor fusion project\validation experiment\Moticon Data\hannah3.txt');
    p2.free=-fillmissing(p2.free.data(:,22),'spline');
end