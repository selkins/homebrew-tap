require 'formula'

class Solr36 < Formula
  homepage 'http://lucene.apache.org/solr/'
  url 'http://www.apache.org/dyn/closer.cgi?path=lucene/solr/3.6.2/apache-solr-3.6.2.tgz'
  sha1 '3a1a40542670ea6efec246a081053732c5503ec1'

  def script; <<-EOS.undent
    #!/bin/sh
    if [ -z "$1" ]; then
      echo "Usage: $ solr path/to/config/dir"
    else
      cd #{libexec}/example && java -Dsolr.solr.home=$1 -jar start.jar
    fi
    EOS
  end

  def install
    libexec.install Dir['*']
    (bin+'solr').write script
  end

  def caveats; <<-EOS.undent
    To start solr:
      solr path/to/solr/config/dir

    See the solr homepage for more setup information:
      brew home solr
    EOS
  end
end
