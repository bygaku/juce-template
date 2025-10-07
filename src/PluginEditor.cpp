#include "PluginProcessor.h"
#include "PluginEditor.h"


//==============================================================================
PluginAudioProcessorEditor::PluginAudioProcessorEditor (PluginAudioProcessor& p)
    : AudioProcessorEditor (&p), processorRef (p)
{
    juce::ignoreUnused (processorRef);

    // Make sure that before the constructor has finished, you've set the
    // editor's size to whatever you need it to be.
    setSize (400, 300);

    exampleImage = juce::Drawable::createFromImageData (BinaryData::imgexample_png, BinaryData::imgexample_pngSize);
}

PluginAudioProcessorEditor::~PluginAudioProcessorEditor()
{
}

//==============================================================================
void PluginAudioProcessorEditor::paint (juce::Graphics& g)
{
    // (Our component is opaque, so we must completely fill the background with a solid colour)
    g.fillAll (juce::Colours::white);
    
    exampleImage->drawWithin(g, getLocalBounds().toFloat(), juce::Justification::centred, 1);

    g.setColour (juce::Colours::black);
    g.setFont (40.0f);
    g.drawFittedText ("Hello World!", getLocalBounds(), juce::Justification::centred, 1);
}

void PluginAudioProcessorEditor::resized()
{
    // This is generally where you'll want to lay out the positions of any
    // subcomponents in your editor..

    // get area for layout
    auto area = getLocalBounds();
    auto center = area.getCentre();
}
