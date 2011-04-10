module ActiveSupport
  class BufferedLogger
    def flush
      @guard.synchronize do
        unless buffer.empty?
          old_buffer = buffer
          all_content = StringIO.new
          old_buffer.each do |content|
            all_content << content
          end
          @log.write(all_content.string)
        end

        if @log.stat.size > 1_000_000
          log = @log.path
          @log.close
          File.atomic_write(log) do |file|
            file.write(IO.readlines(log)[-1000..-1].join)
          end
          @log = open(log, (File::WRONLY | File::APPEND | File::CREAT))
          @log.sync = true
        end

        clear_buffer
      end
    end
  end
end
