classdef TestLaplacian
    %TestLaplacian
    properties (Constant)
        img = uint8([...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 1 1 1 0 0 0 0;...
            0 0 0 1 1 1 0 0 0 0;...
            0 0 0 1 1 1 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
        ]);
    end

    methods (Static)
        function test_1
            result = cv.Laplacian(TestLaplacian.img);
            validateattributes(result, {class(TestLaplacian.img)}, ...
                {'size',size(TestLaplacian.img)});
        end

        function test_2
            result = cv.Laplacian(TestLaplacian.img, 'KSize',5);
            validateattributes(result, {class(TestLaplacian.img)}, ...
                {'size',size(TestLaplacian.img)});
        end

        function test_3
            result = cv.Laplacian(TestLaplacian.img, 'DDepth',-1, ...
                'KSize',1, 'Scale',1, 'Delta',0, 'BorderType','Default');
            validateattributes(result, {class(TestLaplacian.img)}, ...
                {'size',size(TestLaplacian.img)});
        end

        function test_error_1
            try
                cv.Laplacian();
                throw('UnitTest:Fail');
            catch e
                assert(strcmp(e.identifier,'mexopencv:error'));
            end
        end
    end

end
