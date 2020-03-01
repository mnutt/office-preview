@0x9f8088d86239b725;

using Powerbox = import "/sandstorm/powerbox.capnp";
using ApiSession = import "/sandstorm/api-session.capnp".ApiSession;

const docTagValue :ApiSession.PowerboxTag = (
  canonicalUrl = "https://sandstorm.io/preview/doc",
);

const xlsTagValue :ApiSession.PowerboxTag = (
  canonicalUrl = "https://sandstorm.io/preview/xls",
);

const pptTagValue :ApiSession.PowerboxTag = (
  canonicalUrl = "https://sandstorm.io/preview/ppt",
);

const docQuery :Powerbox.PowerboxDescriptor = (
  tags = [
    (id = 0xc879e379c625cdc7, value = .docTagValue),
  ],
);

const xlsQuery :Powerbox.PowerboxDescriptor = (
  tags = [
    (id = 0xc879e379c625cdc7, value = .xlsTagValue),
  ],
);

const pptQuery :Powerbox.PowerboxDescriptor = (
  tags = [
    (id = 0xc879e379c625cdc7, value = .pptTagValue),
  ],
);
