<template lang="pug">
div.pt-20(class="lg:pt-24")
  // Alpha Section
  section.alpha.bg-cover.bg-top.flex.items-center(class="md:bg-left lg:bg-top")
    .container.pb-10(class="sm:pb-0 md:py-32")
      .flex.justify-end.pt-24(class="sm:pt-32 md:pt-0 lg:px-10")
        .text-center.px-8(class="md:w-2/5 md:px-0")
          img(class="sm:w-4/5 md:w-full" src="~assets/images/joshua-and-kelsie.svg")
          p.text-white.font-header.mb-8(class="md:mb-12") Est. 2004
          p.text-white.font-header.mb-8(class="sm:text-xl md:mb-12") We live in Ukraine where we strive to tell others about God's gift of eternal life through Jesus Christ.
          button.btn.btn-lg.btn-blue Meet our Family
</template>

<style>
.alpha {
  background-image: url("~assets/images/josh-kels-cover-768w.jpg");
  min-height: 100vh;
}

@media (min-width: 768px) {
  .alpha {
    background-image: url("~assets/images/josh-kels-cover-2500w.jpg");
    min-height: 70vh;
  }
}
</style>
