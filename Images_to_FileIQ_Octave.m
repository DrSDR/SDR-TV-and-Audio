


clear all
close all


pkg load image


data = imread('pic1.jpg');
data = rgb2gray(data);
data = imresize(data,[800,800]);
data = data(end:-1:1,:);
data = double(data);
data = ifftshift(data,2);
data = ifft(data,[],2);

data = reshape(data.',1,[]);
iq = data / max( abs(data));
iq = [ iq];


data = imread('pic2.jpg');
data = rgb2gray(data);
data = imresize(data,[800,800]);
data = data(end:-1:1,:);
data = double(data);
data = ifftshift(data,2);
data = ifft(data,[],2);

data = reshape(data.',1,[]);
data = data / max( abs(data));
iq = [iq data];


data = imread('pic3.jpg');
data = rgb2gray(data);
data = imresize(data,[800,800]);
data = data(end:-1:1,:);
data = double(data);
data = ifftshift(data,2);
data = ifft(data,[],2);

data = reshape(data.',1,[]);
data = data / max( abs(data));
iq = [iq data];

data = imread('pic4.jpg');
data = rgb2gray(data);
data = imresize(data,[800,800]);
data = data(end:-1:1,:);
data = double(data);
data = ifftshift(data,2);
data = ifft(data,[],2);

data = reshape(data.',1,[]);
data = data / max( abs(data));
iq = [iq data];

data = imread('pic5.jpg');
data = rgb2gray(data);
data = imresize(data,[800,800]);
data = data(end:-1:1,:);
data = double(data);
data = ifftshift(data,2);
data = ifft(data,[],2);

data = reshape(data.',1,[]);
data = data / max( abs(data));
iq = [iq data];




iq = iq / max(abs(iq));




%  make the .dat file  float32 of IQIQIQIQIQ...   use gnuradio file source block
datafile = [ real(iq) ; imag(iq) ];

datafile = reshape(datafile, 1, []);

[filename pathname ] = uiputfile( 'GNURadio_IQ50KHZ.bin', 'Save Bin File To:  ');

fid = fopen ([pathname filename], 'w', 'l');

fwrite(fid, datafile, 'float32');

fclose (fid);











