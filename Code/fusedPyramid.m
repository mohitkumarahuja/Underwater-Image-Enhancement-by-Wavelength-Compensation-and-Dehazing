function [ fusedPyramid ] = fusedPyramid( input_args )

for i = 1 : 5
 fusedPyramid{i} = (gaussianPyramid1{i} .* laplacianPyramid1{i}) + (gaussianPyramid2{i} .* laplacianPyramid2{i});
end

end

