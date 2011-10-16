Tally
=====

Description
-----------

A Tally board for a Triage that takes Redmine updates
and counts who performed them. This allows us to track and score who
contributed the most updates and edits to tickets.

Assumes the Redmine instance has the plugin:

    https://github.com/7citylearning/updates_notifier

With the target URL for updates to set to the Tally server, for example:

    http://example.com:4567/tally


Requirements
------------

* `json`
* `data_mapper`
* `dm-sqlite-adapter`
* `dm-adjust`
* `sinatra`

If you want to run the tally-submit testing tool you also need:

* `httpclient`

Installation & Usage
-------------------

1.  Install the required gems on the server

        $ sudo gem install json sinatra data_mapper dm-sqlite-adapter dm-adjust

2.  Run the Tally server:

        $ bin/tally

    This will run tally from the in-built Sinatra 
    webserver. The tally directory also contains a `config.ru`
    file you can use with `rackup` if required.

3.  Browse to the Tally server at http://example.com:4567

4.  You can test the submission of events using the tally-submit
    command like so:

        $ tally-submit --server=http://example.com:4567/tally \
        --first=James --last=Turnbull --email=james@lovedthanlost.net

Author
------

James Turnbull <james@lovedthanlost.net>

License
-------

    Author:: James Turnbull (<james@lovedthanlost.net>)
    Copyright:: Copyright (c) 2011 James Turnbull
    License:: Apache License, Version 2.0

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
