%% Load the input video
vidReader = VideoReader('flow.avi');

%% Create optical flow objects
opticFlowLK = opticalFlowLK();
opticFlowHS = opticalFlowHS();
%% do for each video frame
while hasFrame(vidReader)
    % read a video frame
    frame = readFrame(vidReader);
    
    % estimate the LK-based motion field
    flowLK = estimateFlow(opticFlowLK,frame);
    % estimate the HS-based motion field  
    flowHS = estimateFlow(opticFlowHS,frame);
    % display the LK optical flow 
    imshow(frame)
    hold on
    plot(flowLK,'DecimationFactor',[5 5],'ScaleFactor',10)
    hold off
    subplot(1,2,1);
    
    % display the HS optical flow
    imshow(frame)
    hold on
    plot(flowHS,'DecimationFactor',[5 5],'ScaleFactor',25)
    hold off
    subplot(1,2,2);
    
    % pause execution (helps in updating the subplots)
    pause(0)
end