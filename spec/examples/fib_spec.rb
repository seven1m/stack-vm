require_relative '../spec_helper'

describe 'Fib' do
  let(:stdout) { StringIO.new }

  let(:subject) { Program.new(code, stdout: stdout) }

  before { subject.run }

  context 'recursive version' do
    let(:code) do
      <<-END
        (def fib
          (fn (n)
            (if (< n 2)
                n
                (+
                  (fib (- n 1))
                  (fib (- n 2))))))
        (print (fib 8))
      END
    end

    it 'prints 21' do
      stdout.rewind
      expect(stdout.read).to eq('21')
    end
  end

  context 'recursive, tail-call version' do
    let(:code) do
      <<-END
        (def fib
          (fn (n)
            (def f
              (fn (i c n)
                (if (== i 0)
                    c
                    (f (- i 1) n (+ c n)))))
            (f n 0 1)))
        (print (fib 8))
      END
    end

    it 'prints 21' do
      stdout.rewind
      expect(stdout.read).to eq('21')
    end
  end
end
