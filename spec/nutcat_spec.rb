require 'spec_helper'
require 'nutcat'
require 'catpix'

describe Nutcat do
  describe 'class' do
    specify { expect(described_class).to respond_to(:render) }
  end

  describe 'render' do
    context 'when nil is given' do
      it 'calls system open with the img url of a cat' do
        expect(Kernel).to receive(:system).and_return(true)

        expect(described_class.render(nil)).to eq(true)
      end
    end
    
    context 'when browser is given' do
      it 'calls system open with the img url of a cat' do
        expect(Kernel).to receive(:system).and_return(true)

        expect(described_class.render('browser')).to eq(true)
      end
    end
    
    context 'when fact is given' do
      let(:cat) { double(fact: 'test') }

      it 'prints a cat fact in the console' do
        io = StringIO.new("")
        $stdout = io
        expect(Nutcat::Cat).to receive(:new).and_return(cat)

        expect { described_class.render('fact') }
          .to change { io.rewind; io.read }
          .to("test\n")

        $stdout = STDOUT
      end
    end
    
    context 'when catpix is given' do
      let(:cat) { double(save: true, file: Tempfile.open('foo.jpg') { |w| w << "foo" }) }

      it 'prints a cat in the terminal' do
        io = StringIO.new("")
        $stdout = io
        expect(Nutcat::Cat).to receive(:new).and_return(cat)
        expect(Catpix).to receive(:print_image).and_return(true)

        expect(described_class.render('catpix')).to eq(true)

        $stdout = STDOUT
      end
    end
    
    context 'when file is given' do
      it 'writes the cat to a file on the desktop' do
        io = Tempfile.new('foo.bar')
        expect(File).to receive(:open).and_return(io)

        described_class.render('file')
        
        io.reopen('rb')
        expect(io.size).not_to eq(0)
        io.unlink
      end
    end

    context 'when an unknown command is given' do
      specify {
        expect { described_class.render('foo') }
          .to raise_error(described_class::Renderer::RendererKindError)
      }
    end
  end
end