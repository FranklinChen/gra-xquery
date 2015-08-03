(:~
  @author Franklin Chen

  Use Saxon throughout, the free Saxon-HE.

  http://saxon.sourceforge.net/

  Sample gra query.
:)

xquery version "3.0";

(: Imports :)

(: Namespaces :)

(:
  Commented out because

  XQST0009: This Saxon version and license does not allow use of 'import schema'
:)
(:
import schema namespace tb =
  "http://www.talkbank.org/ns/talkbank"
  at "talkbank.xsd";
:)

(: Saxon-HE: not schema-aware :)
declare namespace tb =
  "http://www.talkbank.org/ns/talkbank";

declare namespace saxon = "http://saxon.sf.net/";

(: Options :)
(: TODO
declare option saxon:output "method = text";
:)
(:
declare option saxon:output "omit-xml-declaration = yes";
declare option saxon:output "doctype-system = about:legacy-compat";
declare option saxon:output "indent = yes";
:)

(: Functions :)

(:~
  @param $u utterance, assumed to be top-level
  @param $i 1-based index into mor base units (note clitics separate them)
  @return gra element in utterance $u at index $i
:)
declare function local:utterance-gra-index(
  $u as element(tb:u),
  $i as xs:integer
)
  as element(tb:gra)?
{
  ($u//tb:gra)[$i]
};

(: Driver :)

(:
  Look at SUBJ
:)
for $u in /tb:CHAT/tb:u
where $u//tb:w/tb:mor/tb:gra/@relation='SUBJ'
return local:utterance-gra-index($u, 2)
