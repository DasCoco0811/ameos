<template>
    <breeze-authenticated-layout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Dashboard
            </h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 bg-white border-b border-gray-200">
                        You're logged in!
                    </div>
                </div>
            </div>
        </div>

        <ProgressWidget></ProgressWidget>
        <FeatureBadgesWidget></FeatureBadgesWidget>
        <MembersWidget></MembersWidget>

    </breeze-authenticated-layout>
</template>

<script>
    import MembersWidget from '@/Components/MembersWidget'
    import ProgressWidget from '@/Components/ProgressWidget'
    import FeatureBadgesWidget from '@/Components/FeatureBadgesWidget'
    import BreezeAuthenticatedLayout from '@/Layouts/Authenticated'

    export default {
        components: {
            ProgressWidget,
            FeatureBadgesWidget,
            BreezeAuthenticatedLayout,
            MembersWidget,
        },

        props: {
            auth: Object,
            errors: Object,
        },
    }
</script>
