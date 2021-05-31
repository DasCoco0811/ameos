<template>
   <div>
       <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="overflow-hidden shadow-sm sm:rounded-lg" style="background-color: #212529;">
                <div class="creator-container">   
                    <div class="creator-header">
                        <ul>
                            <li>
                                <span>icon</span>
                                <span>Status</span>
                            </li>
                            <li>
                                <span>icon</span>
                                <span>Blog POst</span>
                            </li>
                            <li>
                                <span>icon</span>
                                <span>Poll</span>
                            </li>
                        </ul> 
                    </div>
                    <div class="creator-content">
                        <textarea cols="60" rows="15"></textarea>
                    </div>
                    <div class="creator-footer">
                        <span>icon</span>
                        <span>icon</span>
                        <span>icon</span>
                        <button>Discord</button>
                        <button>Post</button>
                    </div>
                </div>    
            </div>
        </div>
   </div>
</template>

<script>
import StatsBoxWidgetCopy from './StatsBoxWidget copy.vue'
    export default {
  components: { StatsBoxWidgetCopy },

    }
</script>
